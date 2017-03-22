package util;


import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.AuthenticationInfo;
import org.apache.shiro.authc.AuthenticationToken;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.SimpleAuthenticationInfo;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.crypto.hash.SimpleHash;
import org.apache.shiro.realm.AuthenticatingRealm;


/**
 * Created by Kevin on 2017/3/22.
 */
public class MyRealmTest extends AuthenticatingRealm {

    @Override
    protected AuthenticationInfo doGetAuthenticationInfo(
            AuthenticationToken token) throws AuthenticationException {
        // 将AuthenticationToken对象转换成UsernamePasswordToken对象
        UsernamePasswordToken upToken = (UsernamePasswordToken) token;
        // 获取UsernamePasswordToken中的用户名
        String username = upToken.getUsername();
        // 从数据库中查询 username 对应的用户记录
        System.out.println("从数据库中查找" + username + "的信息");
        // 若用户的信息不存在，则抛出UnknownAccountException异常。
        if ("unknown".equals(username)) {
            throw new UnknownAccountException("用户不存在");
        }
        // 根据用户的信息进行反馈，则抛出LockedAccountException异常。
        if ("han".equals(username)) {
            throw new LockedAccountException("用户被锁定");
        }
        // 根据用户的信息来封装SimpleAuthenticationInfo对象。
        // 当前 realm 对象的 name
        String realmName = getName();
        // 认证的实体信息。
        Object principal = username;
        // 密码
        Object credentials = "0d529a42cbebd3943ad4709d8dea32a2";
        SimpleAuthenticationInfo info = new SimpleAuthenticationInfo(principal,
                credentials, realmName);
        return info;
    }

    /**
     * 明文进行谜面进行加密
     *
     * @param args
     */
    public static void main(String[] args) {
        int hashIterations = 10000;//加密的次数
        Object salt = "eteokues";//盐值
        Object credentials = "123456";//密码
        String hashAlgorithmName = "MD5";//加密方式
        Object simpleHash = new SimpleHash(hashAlgorithmName, credentials,
                salt, hashIterations);
        System.out.println("加密后的值----->" + simpleHash);
    }

}