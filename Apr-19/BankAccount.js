class BankAccount {
    constructor(owner, balance=0) {
        this.owner = owner
        this.balance = balance    
    }
    deposit(amount) {
        if (amount >= 0) {
            this.balance += amount
        }
        else {
            console.log('Вы ушли в минус');
        }
    }
    witdraw(amount) {
        if (amount <= this.balance) {
            this.balance -= amount
        }
        else {
            console.log('нет ');
        }

    }
    }

    let a = new BankAccount('ayo')
    a.deposit(100)
    a.witdraw(100)