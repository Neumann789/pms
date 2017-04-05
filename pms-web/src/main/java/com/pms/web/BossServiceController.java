/*package com.pms.web;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.dubbo.common.utils.StringUtils;
import com.alibaba.fastjson.JSON;
import com.zb.payment.boss.common.BossException;
import com.zb.payment.boss.common.BossUtil;
import com.zb.payment.boss.facade.BossService;

@RestController
public class BossServiceController {
	
	@Autowired
	private BossService bossServiceImpl;
	
	private final static Logger logger = LoggerFactory.getLogger(BossServiceController.class);
	
	
	@RequestMapping("search/searchFxiData.json")
	public Map searchFxiData(@RequestParam Map repMap){
		
		return bossServiceImpl.searchFxiData(repMap);
		
	}
	
	
	@RequestMapping("search/searchFxoData.json")
	public Map searchFxoData(@RequestParam Map repMap){
		
		return bossServiceImpl.searchFxoData(repMap);
		
	}
	
}
*/