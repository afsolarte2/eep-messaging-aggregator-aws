exports.handler = async (event) => {
    const personId = 12225654

    const customers = [
        {
            id: 12225654,
            name: 'Katerin',
            lastName: 'Vargas',
            age: 26,
            gender: 'Female'
        },
        {
            id: 133353254,
            name: 'John',
            lastName: 'Doe',
            age: 32,
            gender: 'Male'
        },
        {
            id: 5634534,
            name: 'Jane',
            lastName: 'Doe',
            age: 40,
            gender: 'Male'
        }
    ]

    return customers.find(person => person.id == personId)
}
