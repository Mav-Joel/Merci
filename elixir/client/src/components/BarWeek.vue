<template>
  <div id="app">
    <Bar
      :chart-options="chartOptions"
      :chart-data="chartData"
      :chart-id="chartId"
      :dataset-id-key="datasetIdKey"
      :plugins="plugins"
      :css-classes="cssClasses"
      :styles="styles"
      :width="width"
      :height="height"
    />
  </div>
</template>

<script>
import { Bar } from "vue-chartjs/legacy";
import axios from "axios";

import {
  Chart as ChartJS,
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LinearScale,
} from "chart.js";

ChartJS.register(
  Title,
  Tooltip,
  Legend,
  BarElement,
  CategoryScale,
  LinearScale
);

export default {
  name: "BarChart",
  components: {
    Bar,
  },
  props: {
    chartId: {
      type: String,
      default: "bar-chart",
    },
    datasetIdKey: {
      type: String,
      default: "label",
    },
    width: {
      type: Number,
      default: 400,
    },
    height: {
      type: Number,
      default: 400,
    },
    cssClasses: {
      default: "",
      type: String,
    },
    styles: {
      type: Object,
      default: () => {},
    },
    plugins: {
      type: Array,
      default: () => [],
    },
  },
  data() {
    return {
      workingtime: [],

      chartData: {
        labels: [
          "Lundi",
          "Mardi",
          "Mercredi",
          "Jeudi",
          "Vendredi",
          "Samedi",
          "Dimanche",
        ],
        datasets: [
          {
            label: "Data One",
            backgroundColor: "#f87979",
            data: [40, 20, 12, 39, 10, 40, 39, 80, 40, 20, 12, 11],
          },
        ],
      },
      chartOptions: {
        responsive: true,
        maintainAspectRatio: false,
      },
    };
  },

  mounted() {
    this.getWorkingTimes();
    this.parseDate();
  },

  methods: {
    async parseDate() {
      const hello = this.workingtime;
      console.log("cccccccccccccccccc", hello);

      for (let i = 0; i < hello.length; i++) {
        console.log("hello");
      }

      // for (let i = 0; i < workingtime.length; i++) {
      //   const start = workingtime.start;
      //   console.log("hahahahahahaha", start);
      // }
      // const start = Date.parse(workingtime.start);
    },

    async getWorkingTimes() {
      const id = localStorage.id;
      await axios({
        method: "get",
        url: `http://localhost:4000/api/workingtimes/${id}`,
        format: "json",
        headers: {
          Authorization: `Bearer ${localStorage.token}`,
        },
      }).then((response) => {
        this.workingtime = response.data.data;
        console.log("fresfsfsfsdfs", response);
      });
    },
  },
};
</script>
