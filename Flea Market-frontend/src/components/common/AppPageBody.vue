<template>
    <div class="main-container">
        <div class="main-content">
            <slot></slot>
        </div>
    </div>
</template>

<script>
    export default {
        name: "PageBody"
    }
</script>

<style scoped>
    .main-container{
        margin-top: 64px;
        display: flex;
        justify-content: center;
    }
    .main-content{
        width: 1500px;
        background-color: #ffffff;
        min-height: 90vh;
    }
</style>