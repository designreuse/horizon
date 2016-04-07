/*
 * @(#)GlobalExceptionHandler.java   2015-09-25
 * 
 * Copyright (c) 2005 im.mate
 *
 * License agreement text here ...
 * 
 */

package data.horizon.handler.exception;

import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.AbstractHandlerExceptionResolver;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * @Description
 *
 * @version        1.0, 2015-09-25
 * @author         huangshiqian    
 */
public class GlobalExceptionHandler extends AbstractHandlerExceptionResolver {

  /**
   * @Description
   *
   * @param httpServletRequest HttpServletRequest
   * @param httpServletResponse HttpServletResponse
   * @param o Object
   * @param e Exception
   *
   * @return ModelAndView
   */
  @Override
  protected ModelAndView doResolveException(
          HttpServletRequest httpServletRequest,
          HttpServletResponse httpServletResponse, Object o, Exception e) {
    return new ModelAndView("/");
  }
}


//~ Formatted by Jindent --- http://www.jindent.com
