package com.project.tain20210101;

import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultHandlers.print;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration(locations = {"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml","file:src/main/webapp/WEB-INF/spring/root-context.xml"})
public class TestMember {
	private static final Logger logger = LoggerFactory.getLogger(TestMember.class);
	
	private MockMvc mockMvc;
	@Autowired
	private WebApplicationContext wac;
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(this.wac).build();
	}
	
	@Test
	public void testMemberJoin() {
		try {
			mockMvc.perform(post("/member/join.do")
					.param("m_id","zzz")
					.param("m_pw","zzz")
					.param("m_name","zzz")
					.param("m_email","rhkrdmswl@gmail.com")
					.param("m_birth","1997-01-03")
					.param("m_phone","00000000")
					.param("m_addr1","00000")
					.param("m_addr2","aaa")
					.param("m_addr3","aaa")
					.param("m_usage","G")
					.param("m_status","1")
					.param("m_activity","2")
					.param("language","K")
					)
			.andDo(print())
			.andExpect(status().isOk());
			
		} catch (Exception e) {
			logger.error(">>>>>" + e.getMessage());
		}
	}
	

}
