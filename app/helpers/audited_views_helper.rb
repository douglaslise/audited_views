module AuditedViewsHelper

  def audited_controls(model)
    render "controls", model: model
  end

  #Retorna audits para o model ou para todos os models caso o parâmetro for uma relation ou array
  #Retorna audits para todos os associados aos models
  def audits_for(models)
    models = [models] unless models.kind_of?(Array) || models.kind_of?(ActiveRecord::Relation)
    audits = []
    models.each do |model|
      audits += model.audits#.reject {|a| a.action =~ /create/ }
      audits += model.associated_audits if model.respond_to?(:associated_audits)
    end
    audits.sort do |a,b|
      b.created_at <=> a.created_at
    end
  end

  def audit_link(model, text = nil)
    text ||= I18n.t("audits.link_text")
    unless params[:show_log]
      link_to "#{request.path}?show_log=true#audits", class: 'btn btn-default pull-right' do
        raw(content_tag(:i, nil, class: "glyphicon glyphicon-time")) +
        " #{text}"
      end
    end
  end

  def audit_object_info(audit)
    classe = audit.auditable_type.constantize
    content_tag(:span, title: "Id #{audit.auditable_id}") do
      begin
        begin
          classe.find(audit.auditable_id).to_s
        rescue
          if classe.respond_to?(:with_deleted)
            classe.with_deleted.find(audit.auditable_id).to_s
          else
            raise
          end
        end
      rescue ActiveRecord::RecordNotFound => e
        I18n.t(:registro_excluido, scope: 'audits')
      end
    end
  end

  def created_by_info(model)
    html = []

    html << t("audits.created_at")
    html << ltime(model.created_at)
    if (nome = get_model_creator(model))
      html << t("audits.created_by")
      html << nome
    end

    raw html.join(" ")
  end

  def ldate(date)
    I18n.l(date, format: :data) if date
  end

  def ltime(time)
    I18n.l(time, format: :short) if time
  end

  def format_audited_value(value)
    case value
    when true, false
      l("audited.#{value}_word")
    when Date
      ldate value
    when NilClass
      "-"
    when String
      sanitize(value)
    else
      value
    end
  end

  def get_model_creator(model)
    model.audits.where(action: 'create').first.try(:user)
  end

  def created_by(model)
    raw [nome_usuario(get_model_creator(model)), ltime(model.created_at)]
      .compact
      .delete_if(&:empty?)
      .join(" - ")
  end

  def panel_class_for_audit_action(action)
    case action
    when "create"  then "panel-success"
    when "update"  then "panel-info"
    when "destroy" then "panel-danger"
    else                "panel-default"
    end
  end

  def audit_record_human_field(audit_record, field)
    # The most of reference field locales are defined only with the association name (not field name)
    normalized_field = field.gsub(/_id$/, "")
    audit_record
      .auditable_type
      .constantize
      .human_attribute_name(normalized_field)
  end

end
