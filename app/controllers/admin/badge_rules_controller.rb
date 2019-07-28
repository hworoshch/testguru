class Admin::BadgeRulesController < Admin::BaseController
  before_action :find_badge_rule, only: [:show, :edit, :update, :destroy]

  def index
    @badge_rules = BadgeRule.all
  end

  def show
  end

  def new
    @badge_rule = BadgeRule.new
  end

  def edit
  end

  def create
    @badge_rule = BadgeRule.new(badge_rule_params)
    if @badge_rule.save
      redirect_to admin_badge_rules_path, notice: t('.success')
    else
      render :new
    end
  end

  def update
    if @badge_rule.update(badge_rule_params)
      redirect_to admin_badge_rules_path
    else
      render :edit
    end
  end

  def destroy
    @badge_rule.destroy
    redirect_to admin_badge_rules_path
  end

  private

  def find_badge_rule
    @badge_rule = BadgeRule.find(params[:id])
  end

  def badge_rule_params
    params.require(:badge_rule).permit(:rule, :value)
  end
end
