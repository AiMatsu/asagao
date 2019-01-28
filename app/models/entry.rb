class Entry < ApplicationRecord
  belongs_to :author, class_name: "Member", foreign_key: "member_id"

  STATUS_VALUE = %W(draft member_only public)
  # statusカラムにセットできる値をの配列を定数STATUS_VALUEとして定義し、バリデーションの設定で使用。

  validates :title, presence: true, length: {maximum: 200}
  validates :body, :posted_at, presence: true
  validates :status, inclusion: {in: STATUS_VALUE}

  scope :common, -> { where(status: "public")}
  scope :published, -> { where("status <>?", "draft")}
  scope :full, ->(member){
    where("status <>? OR member_id = ?","draft", member.id)
  }
  scope :readable_for, -> (member){ member ? full(member) : common}

  class << self
    # statusを引数に、日本語文字列を取得する
    def status_text(status)
      I18n.t("activerecord.attributes.entry.status_#{status}")
    end

    # [["下書き", "draft"], ...]のような配列を作成する。画面上のリストに使用する。
    # mapメソッドで、STATUS_VALUES変数の各要素をstatusという変数で取り出し、配列を組む
    def status_options
      STATUS_VALUE.map {|status| [status_text(status), status]}
    end
  end
end
