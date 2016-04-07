package data.horizon.utils;

import data.horizon.core.config.model.User;
import javax.naming.*;
import javax.naming.directory.*;
import javax.naming.ldap.*;
import java.io.InputStream;
import java.util.HashMap;
import java.util.Hashtable;
import java.util.Map;
import java.util.Properties;

/**
 * Created by huyang on 2016/4/6.
 */
public class UserLDAPUtil {

  private static String[] COLS = new String[]{"mail","mailNickname","displayName","department"};

  private static LdapContext getContext() throws Exception
  {
    Hashtable<String,String> env = new Hashtable<String,String>();
    Properties p = new Properties();
    p.load(Thread.currentThread().getContextClassLoader().getResourceAsStream("config.properties"));
    env.put(Context.INITIAL_CONTEXT_FACTORY,p.getProperty("ldapFactory"));
    env.put(Context.PROVIDER_URL,p.getProperty("ldapUrl"));
    env.put(Context.SECURITY_PRINCIPAL,p.getProperty("ldapAccount"));
    env.put(Context.SECURITY_CREDENTIALS,p.getProperty("ldapPwd"));
    env.put(Context.SECURITY_AUTHENTICATION, "simple");
    LdapContext ctxTDS = new InitialLdapContext(env, null);
    return ctxTDS;
  }

  public static User getOneUser(String email) throws Exception
  {
    SearchControls searchControls = new SearchControls();
    searchControls.setSearchScope(SearchControls.SUBTREE_SCOPE);
    searchControls.setReturningAttributes(COLS);
    NamingEnumeration<SearchResult> enu = getContext().search("ou=KeWenDangDang,dc=dangdang,dc=com", "(mail="+email+")", searchControls);
    Map<String,String> tmp = new HashMap<String,String>();
    while(enu.hasMore())
    {
      SearchResult result = enu.next();
      NamingEnumeration<? extends Attribute> attrs = result.getAttributes().getAll();
      while (attrs.hasMore())
      {
        Attribute attr = attrs.next();
        tmp.put(attr.getID(), (String)attr.get());
      }
    }
    if(!tmp.isEmpty()){
      User user = new User(tmp.get(COLS[0]),tmp.get(COLS[1]),tmp.get(COLS[2]),tmp.get(COLS[3]));
      return user;
    }
    return  null;
  }
}
