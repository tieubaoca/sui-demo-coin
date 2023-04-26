module demo_coin::DemoCoin{
    use sui::tx_context::{Self, TxContext};
    use std::option;

    struct DEMOCOIN has drop{}

 

    fun init(witness: DEMOCOIN, ctx: &mut TxContext){
        let (treasury, coin_metadata) = sui::coin::create_currency<DEMOCOIN>(
            witness, 
            8,
            b"DC",
            b"DemoCoin",
            b"This is my demo coin",
            option::none(),
            ctx);
        let sender = tx_context::sender(ctx);

        // let coin = sui::coin::mint<DEMOCOIN>(&mut treasury, 1000000000000000000, ctx);
        // sui::transfer::public_transfer(coin, sender);
        sui::transfer::public_transfer(treasury, sender);
        sui::transfer::public_share_object(coin_metadata);

    }

}