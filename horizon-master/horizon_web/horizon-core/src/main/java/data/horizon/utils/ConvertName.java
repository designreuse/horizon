package data.horizon.utils;

import org.springframework.stereotype.Component;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * Created by huyang on 2015/11/13.
 */
@Component
public class ConvertName {
  private static final String SEPERATOR = ",";
  private static final String REGEX = "(\\p{Alpha}\\w*)\\[(\\d+)-(\\d+)\\](\\w*)";
  private Pattern pattern = Pattern.compile(REGEX);
  private Matcher matcher;

  public String convertShortNameToNormalName(String shortName)
  {
    int start;
    int end;
    String prefix;
    String suffix;
    String source_db_names="";

    String[] dbNames = shortName.split(SEPERATOR);
    for(String dbName:dbNames)
    {
      if(dbName.indexOf("[") > 0)
      {
        matcher = pattern.matcher(dbName);
        boolean b = matcher.matches();
        prefix = matcher.group(1);
        suffix = matcher.group(4);
        start = Integer.parseInt(matcher.group(2));
        end = Integer.parseInt(matcher.group(3));
        for (int i = start; i <= end; i++) {
          source_db_names += prefix + Integer.toString(i) + suffix + SEPERATOR;
        }
      }else {
        source_db_names += dbName + SEPERATOR;
      }
    }
    return source_db_names.substring(0,source_db_names.lastIndexOf(SEPERATOR));
  }
}
