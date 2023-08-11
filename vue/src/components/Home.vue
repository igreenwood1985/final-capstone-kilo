<template>
  
    <div class="section-1">
        <div class="header-body">

            <div class="header-body-content">
                <p class="main-body-text">This website is awesome,</p>
                <p class="second-body-text">This website has some subtext that goes here under the main title. 
                                            It's a smaller font and the color is lower contrast</p>
                <a href="#"><button class="sign-up-button">Sign Up</button></a>
            </div>

            <div class="header-image">
                <h1>placeholder for an image</h1>
            </div>

        </div>

    </div>


</template>

<script>
export default {
    name: 'home',
    data() {
        return {
            searchTerm: ''
        }
    }

}
</script>

<style>
body {
    display: flex;
    flex-direction: column;
    align-items: center;
    font-family: 'Raleway', sans-serif;
    margin: auto;
} 

.section-1 {
    color: #F9FAF8;
    background-color: #1F2937;
    width: 100%;
    height: 90vh;
}

.header {
    display: flex;
    justify-content: space-between;
    align-items: center;
    padding: 5px;
    margin: auto 15%;
}

.header-logo {
    font-size: 24px;
}

ul {
    list-style: none;
    display: flex;
    align-items: center;
    gap: 20px;
}

li {
    font-size: 18px;
    color: #E5E7EB;
}

li > a {
    color: white;
    text-decoration: none;
}

.header-body {
    margin: auto 15% auto 15%;
    padding-top: 120px;
    padding-bottom: 120px;
    display: flex;
    flex-direction: row;
    justify-content: space-between;
}

.header-body-content {
    display: flex;
    flex-direction: column;
    align-items: flex-start;
    
}

.main-body-text {
    font-size: 56px;
    font-weight: bolder;
    color: #F9FAF8
}

p {
    margin-top: 5px;
    margin-bottom: 5px;
    margin-right: 120px;
}

.second-body-text {
    padding-top: 10px;
    padding-bottom: 20px;
    font-size: 21px;
    color: #E5E7EB
}

.sign-up-button {
    color: white;
    background-color: #3882F6;
    padding: 10px 30px;
    font-size: 24px;
    font-weight: bold;
    border-radius: 10px;
    outline: 2px solid white;
}

.header-image {
    background-color: #E5E7EB;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 10px;
    flex: 1 1 100%;
}
</style>