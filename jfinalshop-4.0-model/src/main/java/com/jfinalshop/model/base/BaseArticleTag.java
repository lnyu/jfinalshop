package com.jfinalshop.model.base;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.IBean;

/**
 * Generated by JFinal, do not modify this file.
 */
@SuppressWarnings("serial")
public abstract class BaseArticleTag<M extends BaseArticleTag<M>> extends Model<M> implements IBean {

	public void setArticles(java.lang.Long articles) {
		set("articles", articles);
	}

	public java.lang.Long getArticles() {
		return get("articles");
	}

	public void setTags(java.lang.Long tags) {
		set("tags", tags);
	}

	public java.lang.Long getTags() {
		return get("tags");
	}

}
