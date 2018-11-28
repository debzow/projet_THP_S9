class Order < ApplicationRecord
    #cette commande appartient à cet utilisateur précisément, qu'un seul client par commande.
    #et une commande ne peux servir qu'une seule fois.
    belongs_to :user
    has_and_belongs_to_many :items
end
