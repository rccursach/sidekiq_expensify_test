class ImportedExpensesController < ApplicationController
  before_action :set_imported_expense, only: [:show, :update, :destroy]

  # GET /imported_expenses
  def index
    @imported_expenses = ImportedExpense.all

    render json: @imported_expenses
  end

  # GET /imported_expenses/1
  def show
    render json: @imported_expense
  end

  # POST /imported_expenses
  def create
    @imported_expense = ImportedExpense.new(imported_expense_params)

    if @imported_expense.save
      render json: @imported_expense, status: :created, location: @imported_expense
    else
      render json: @imported_expense.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /imported_expenses/1
  def update
    if @imported_expense.update(imported_expense_params)
      render json: @imported_expense
    else
      render json: @imported_expense.errors, status: :unprocessable_entity
    end
  end

  # DELETE /imported_expenses/1
  def destroy
    @imported_expense.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_imported_expense
      @imported_expense = ImportedExpense.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def imported_expense_params
      params.require(:imported_expense).permit(:transactionID, :unverified, :cardID, :reportID, :mcc, :tag, :currency, :billable, :amount, :inserted, :reimbursable, :details, :currencyConversionRate, :created, :modifiedAmount, :bank, :receiptID, :receiptFilename, :modifiedCreated, :merchant, :externalID, :convertedAmount, :modified, :category, :modifiedMerchant, :comment, :cardNumber, :transactionHash, :modifiedMCC)
    end
end
