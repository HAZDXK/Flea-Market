<template>
    <div class="foot-container">
        <div class="author">山东师范大学 信息科学与工程学院 智能本2201 喻齐</div>
    </div>
</template>

<script>
    export default {
        name: "Foot"
    }
</script>

<style scoped>
.foot-container {
    width: 100%;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100px;
    background-color: #f5f5f5;
    border-top: 1px solid #e0e0e0;
}

.author {
    color: #999999;
    font-size: 16px;
}
</style>
