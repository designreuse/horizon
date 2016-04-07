package data.horizon.analysis;

import data.horizon.analysis.Type;

import java.io.Serializable;

/**
 * Created by huyang on 2015/12/31.
 */
public interface Resource extends Serializable{
  Type getType();
  String getName();
}