class Content::ItemDecorator < Draper::Decorator
  delegate_all

  def last_updated
    h.format_datetime(public_updated_at)
  end

  def assigned_to_name
    object.allocation ? object.allocation.user.name : 'No one'
  end

  def topics
    titles(object.linked_topics)
  end

  def organisations
    titles(object.linked_organisations)
  end

  def policy_areas
    titles(object.linked_policy_areas)
  end

  def guidance
    h.format_boolean(guidance?)
  end

  def withdrawn
    h.format_boolean(withdrawn?)
  end

  def one_month_page_views
    h.format_number(object.one_month_page_views)
  end

  def six_months_page_views
    h.format_number(object.six_months_page_views)
  end

  def document_type
    object.document_type.titleize
  end

  def auditor
    allocation&.user&.name
  end

  def auditor_org
    allocation.user.organisation&.title
  end

  def proxy_url
    File.join(Proxies::IframeAllowingProxy::PROXY_BASE_PATH, base_path)
  end

private

  def titles(content_items)
    h.format_array(content_items.map(&:title).sort)
  end
end
