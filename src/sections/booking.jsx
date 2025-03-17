import React from 'react';

const Booking = () => {
    return (
        <div>
            <h1>Booking Section</h1>
            <p>Welcome to the booking section. Please fill out the form below to book your appointment.</p>
            <form>
                <label>
                    Name:
                    <input type="text" name="name" />
                </label>
                <br />
                <label>
                    Email:
                    <input type="email" name="email" />
                </label>
                <br />
                <label>
                    Date:
                    <input type="date" name="date" />
                </label>
                <br />
                <button type="submit">Book Now</button>
            </form>
        </div>
    );
};

export default Booking;