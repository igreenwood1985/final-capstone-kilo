<template>
    <p class="label-tag">{{ label }}</p>
</template>

<script>
export default {
  name: "label-tag",
  props: {
    label: String
  }

}
</script>

<style>
/* .label-tag {
  display: inline-block;
 font-size: 10px;
  border: 1px solid gray;
  border-radius: 20px;
  background-color: aliceblue;
  text-align: center;
  max-width: 40%;
} */

.label-tag {
  border: 1px solid grey;
  border-radius: 20px;
  background-color: aliceblue;
  display: inline-block;
  margin: .1rem;
  font-size: 12px;
  padding: 1px;
  padding-right: 3px;
  padding-left: 3px;

}
</style>