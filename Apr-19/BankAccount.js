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
            console.log('Вы ушли в минус')
        }
    }
    withdraw(amount) {
        if (amount <= this.balance) {
            this.balance -= amount
        }
        else {
            console.log('Недостаточно средств на счете')
        }
    }
}

let a = new BankAccount(':)')
a.deposit(200)
a.withdraw(200)
