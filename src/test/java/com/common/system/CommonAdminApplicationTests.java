package com.common.system;

import com.common.system.entity.TreeGridNode;
import com.common.system.entity.TreeGridWrapper;
import com.common.system.service.TreeGridService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class CommonAdminApplicationTests {

	Logger LOG = LoggerFactory.getLogger("CommonAdminApplicationTests");

	@Autowired
	private TreeGridService treeGridService;

	@Test
	public void contextLoads() {
		List<TreeGridNode> list = treeGridService.getMenuTreeGridNodes();
		TreeGridWrapper wrapper = new TreeGridWrapper();
		wrapper.setRows(list);
		wrapper.setTotal(list.size());
		LOG.info(wrapper.toString());
	}
}
