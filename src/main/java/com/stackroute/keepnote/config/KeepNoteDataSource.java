package com.stackroute.keepnote.config;

import javax.sql.DataSource;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.jdbc.datasource.DriverManagerDataSource;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabase;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseBuilder;
import org.springframework.jdbc.datasource.embedded.EmbeddedDatabaseType;

/*
 * Define the bean for DataSource. In our application, we are using MySQL as the
 * dataSource. To create the DataSource bean, we need to know: 1. Driver class
 * name 2. Database URL 3. UserName 4. Password
 */

@Configuration
public class KeepNoteDataSource {

	// h2
	// @Bean
	// public DataSource dataSource() {
	// // no need shutdown, EmbeddedDatabaseFactoryBean will take care of this
	// EmbeddedDatabaseBuilder builder = new EmbeddedDatabaseBuilder();
	// EmbeddedDatabase db =
	// builder.setType(EmbeddedDatabaseType.HSQL).addScript("db/create-db.sql").build();
	// return db;
	// }

	// @Bean
	// public DataSource dataSource() {
	// DriverManagerDataSource dataSource = new DriverManagerDataSource();
	// dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
	// dataSource.setUrl("jdbc:mysql://localhost:3306/keepnote");
	// dataSource.setUsername("root");
	// dataSource.setPassword("root");
	// return dataSource;
	// }

	@Bean
	public DataSource dataSource() {
		// Use this configuration while submitting solution in hobbes.
		DriverManagerDataSource dataSource = new DriverManagerDataSource();
		dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");
		dataSource.setUrl("jdbc:mysql://" + System.getenv("MYSQL_HOST") + ":3306/" + System.getenv("MYSQL_DATABASE")
				+ "?verifyServerCertificate=false&useSSL=false&requireSSL=false");
		dataSource.setUsername(System.getenv("MYSQL_USER"));
		dataSource.setPassword(System.getenv("MYSQL_PASSWORD"));
		return dataSource;
	}

}
