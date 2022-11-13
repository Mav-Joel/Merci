<template>
  <div id="app">
    <Bar :chart-options="chartOptions" :chart-data="chart  Data" :chart-id="chartId" :dataset-id-key="datasetIdKey"
      :plugins="plugins" :css-classes="cssClasses" :styles="styles" :width="width" :height="height" />
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
      week :[
        "Lundi" ,
        "Mardi" ,
        "Mercredi" ,
        "Jeudi" ,
        "Vendredi" ,
        "Samedi" ,
        "Dimanche",
      ],
      days :{
        "Lundi" : 0,
        "Mardi" : 0,
        "Mercredi" : 0,
        "Jeudi" : 0,
        "Vendredi" : 0,
        "Samedi" : 0,
        "Dimanche" : 0,
      },

      chartData: {
        labels: [],

        datasets: [
          {
            label: "Data One",
            backgroundColor: "#f87979",
            data: [],
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
  },

  methods: {

    async getWorkingTimes() {
      const id = localStorage.id;
      await axios({
        method: "get",
        url: `http://18.233.170.155:4000/api/workingtimes/${id}`,
        format: "json",
        headers: {
          Authorization: `Bearer ${localStorage.token}`,
        },
      }).then((response) => {
        const date = response.data.data;

        date.forEach(element => { 
            const day = new Date(element.start).getDay()
            const startDate = new Date(element.start)
            const endDate = new Date(element.end)
            const displayDate = endDate.getHours() - startDate.getHours()
            const delta = this.days[this.week[day]]
            this.days[this.week[day]] = displayDate + delta 
            
        });

        for (const [key, value] of Object.entries(this.days)) {
          if (value != 0) {
            this.chartData.labels.push(key)
            this.chartData.datasets[0].data.push(value)
          }
        }

      });
    },
  },
};
</script>
