<template>
  <div class="footer">
    <div class="footer-text">
      <p>Copyright © Team Kilo, Tech Elevator 2023</p>
    </div>
  </div>
</template>

<script>
export default {
  name: "the-footer",
};
</script>

<style>
.footer {
    background-color: lightgray;
    color: gray;
    font-size: 15px;
    text-align: center;
    padding: 5px;
    border: 1px solid gray;

}

.footer-text > p {
    margin: 0;
}
</style>