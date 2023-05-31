// SPDX-License-Identifier: MIT
pragma solidity >= 0.7.0 < 0.9.0;

// Let's start your roulette coin!
contract Roulette_coin {
    address public minter;
    mapping(address => uint) public balances;

    // contructor를 통해 계약을 생성한 사람의 주소를 minter에 등록합니다.
    constructor() {
        minter = msg.sender;
    }

    // 이벤트 함수
    event Sent(address from, address to, uint amount);

    // 오류가 발생했을 때의 Balance 파라미터 정리
    error insufficientBalance(uint requested, uint available);

    // 계약의 생성자만 mint함수를 사용할 수 있도록 설정하며 해당 주소에 amount가 추가됩니다.
    function mint(address receiver, uint amount) public {
        require(msg.sender == minter);
        balances[receiver] += amount;
    }
    

    // account끼리 mint된 토큰을 거래할 수 있도록 설정
    function send(address receiver, uint amount) public {
        // 보내려는 토큰의 amount가 가지고 있는 토큰보다 많을 때 insufficientBalance 에러를 발생시킨다.
        if (amount > balances[msg.sender])
        revert insufficientBalance({
            requested: amount,
            available: balances[msg.sender]
        });
        balances[msg.sender] -= amount;
        balances[receiver] += amount;
        // 이벤트가 발생했을 때 로깅 작업업
        emit Sent(msg.sender, receiver, amount);
    }
}