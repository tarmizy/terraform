resource "datadog_dashboard_json" "dashboard_json" {
  dashboard = <<EOF
    {
    "title": "Docker - ujicoba dashboard",
    "description": "demo datadog",
    "widgets": [
        {
        "id": 0,
        "layout": {
            "x": 68,
            "y": 10,
            "width": 50,
            "height": 29
        },
        "definition": {
            "title": "Running containers by image",
            "title_size": "16",
            "title_align": "left",
            "show_legend": false,
            "legend_size": "0",
            "time": {
            "live_span": "1h"
            },
            "type": "timeseries",
            "requests": [
            {
                "response_format": "timeseries",
                "queries": [
                {
                    "data_source": "metrics",
                    "name": "query1",
                    "query": "sum:docker.containers.running{$scope} by {docker_image}.fill(0)"
                }
                ],
                "display_type": "bars"
            }
            ],
            "custom_links": []
        }
        },
        {
        "id": 1,
        "layout": {
            "x": 52,
            "y": 98,
            "width": 51,
            "height": 15
        },
        "definition": {
            "title": "Most RAM-intensive containers",
            "title_size": "16",
            "title_align": "left",
            "time": {
            "live_span": "1h"
            },
            "type": "toplist",
            "requests": [
            {
                "style": {
                "palette": "dog_classic"
                },
                "response_format": "scalar",
                "queries": [
                {
                    "data_source": "metrics",
                    "name": "query1",
                    "query": "avg:docker.mem.rss{$scope} by {container_name}",
                    "aggregator": "max"
                }
                ],
                "formulas": [
                {
                    "formula": "query1",
                    "limit": {
                    "count": 5,
                    "order": "desc"
                    }
                }
                ]
            }
            ],
            "custom_links": []
        }
        },
        {
        "id": 2,
        "layout": {
            "x": 0,
            "y": 82,
            "width": 51,
            "height": 15
        },
        "definition": {
            "title": "Most CPU-intensive containers",
            "title_size": "16",
            "title_align": "left",
            "time": {
            "live_span": "1h"
            },
            "type": "toplist",
            "requests": [
            {
                "style": {
                "palette": "cool"
                },
                "response_format": "scalar",
                "queries": [
                {
                    "data_source": "metrics",
                    "name": "query1",
                    "query": "avg:docker.cpu.user{$scope} by {container_name}",
                    "aggregator": "max"
                }
                ],
                "formulas": [
                {
                    "formula": "query1",
                    "limit": {
                    "count": 5,
                    "order": "desc"
                    }
                }
                ]
            }
            ],
            "custom_links": []
        }
        },
        {
        "id": 3,
        "layout": {
            "x": 52,
            "y": 114,
            "width": 51,
            "height": 15
        },
        "definition": {
            "title": "Memory by container",
            "title_size": "16",
            "title_align": "left",
            "show_legend": false,
            "legend_size": "0",
            "time": {
            "live_span": "1h"
            },
            "type": "heatmap",
            "custom_links": [],
            "requests": [
            {
                "response_format": "timeseries",
                "queries": [
                {
                    "data_source": "metrics",
                    "name": "query1",
                    "query": "avg:docker.mem.rss{$scope} by {container_name}"
                }
                ]
            }
            ]
        }
        },
        {
        "id": 4,
        "layout": {
            "x": 89,
            "y": 0,
            "width": 14,
            "height": 9
        },
        "definition": {
            "title": "Running containers",
            "title_size": "16",
            "title_align": "center",
            "time": {
            "live_span": "1m"
            },
            "type": "query_value",
            "requests": [
            {
                "response_format": "scalar",
                "queries": [
                {
                    "data_source": "metrics",
                    "name": "query1",
                    "query": "sum:docker.containers.running{$scope}",
                    "aggregator": "last"
                }
                ]
            }
            ],
            "autoscale": true,
            "text_align": "center",
            "custom_links": [],
            "precision": 0
        }
        },
        {
        "id": 5,
        "layout": {
            "x": 104,
            "y": 0,
            "width": 14,
            "height": 9
        },
        "definition": {
            "title": "Stopped containers",
            "title_size": "16",
            "title_align": "center",
            "time": {
            "live_span": "1m"
            },
            "type": "query_value",
            "requests": [
            {
                "response_format": "scalar",
                "queries": [
                {
                    "data_source": "metrics",
                    "name": "query1",
                    "query": "sum:docker.containers.stopped{$scope}",
                    "aggregator": "last"
                }
                ]
            }
            ],
            "autoscale": true,
            "text_align": "center",
            "custom_links": [],
            "precision": 0
        }
        },
        {
        "id": 6,
        "layout": {
            "x": 0,
            "y": 98,
            "width": 51,
            "height": 15
        },
        "definition": {
            "title": "CPU by container",
            "title_size": "16",
            "title_align": "left",
            "show_legend": false,
            "legend_size": "0",
            "time": {
            "live_span": "1h"
            },
            "type": "heatmap",
            "custom_links": [],
            "requests": [
            {
                "response_format": "timeseries",
                "queries": [
                {
                    "data_source": "metrics",
                    "name": "query1",
                    "query": "avg:docker.cpu.user{$scope} by {container_name}"
                }
                ]
            }
            ]
        }
        },
        {
        "id": 7,
        "layout": {
            "x": 0,
            "y": 50,
            "width": 51,
            "height": 15
        },
        "definition": {
            "title": "CPU user by image",
            "title_size": "16",
            "title_align": "left",
            "show_legend": false,
            "legend_size": "0",
            "time": {
            "live_span": "1h"
            },
            "type": "timeseries",
            "requests": [
            {
                "response_format": "timeseries",
                "queries": [
                {
                    "data_source": "metrics",
                    "name": "query1",
                    "query": "avg:docker.cpu.user{$scope} by {docker_image}.fill(0)"
                }
                ],
                "style": {
                "palette": "cool"
                },
                "display_type": "line"
            }
            ],
            "custom_links": []
        }
        },
        {
        "id": 8,
        "layout": {
            "x": 52,
            "y": 50,
            "width": 51,
            "height": 15
        },
        "definition": {
            "title": "RSS memory by image",
            "title_size": "16",
            "title_align": "left",
            "show_legend": false,
            "legend_size": "0",
            "time": {
            "live_span": "1h"
            },
            "type": "timeseries",
            "requests": [
            {
                "response_format": "timeseries",
                "queries": [
                {
                    "data_source": "metrics",
                    "name": "query1",
                    "query": "avg:docker.mem.rss{$scope} by {docker_image}.fill(0)"
                }
                ],
                "display_type": "line"
            }
            ],
            "custom_links": []
        }
        },
        {
        "id": 9,
        "layout": {
            "x": 0,
            "y": 17,
            "width": 51,
            "height": 24
        },
        "definition": {
            "time": {
            "live_span": "1d"
            },
            "requests": [
            {
                "query": {
                "query_string": "source:docker",
                "data_source": "event_stream",
                "event_size": "s"
                },
                "columns": [],
                "response_format": "event_list"
            }
            ],
            "type": "list_stream"
        }
        },
        {
        "id": 10,
        "layout": {
            "x": 0,
            "y": 8,
            "width": 51,
            "height": 9
        },
        "definition": {
            "time": {
            "live_span": "1d"
            },
            "type": "event_timeline",
            "query": "source:docker",
            "tags_execution": "and"
        }
        },
        {
        "id": 11,
        "layout": {
            "x": 68,
            "y": 0,
            "width": 20,
            "height": 9
        },
        "definition": {
            "title": "Running container change",
            "title_size": "16",
            "title_align": "center",
            "time": {
            "live_span": "5m"
            },
            "type": "query_value",
            "requests": [
            {
                "conditional_formats": [
                {
                    "comparator": ">=",
                    "value": 80,
                    "palette": "white_on_green"
                },
                {
                    "comparator": ">",
                    "value": 50,
                    "palette": "white_on_yellow"
                },
                {
                    "comparator": ">=",
                    "value": 0,
                    "palette": "white_on_red"
                }
                ],
                "response_format": "scalar",
                "queries": [
                {
                    "data_source": "metrics",
                    "name": "query1",
                    "query": "sum:docker.containers.running{$scope}",
                    "aggregator": "last"
                }
                ],
                "formulas": [
                {
                    "formula": "100 * (query1 / timeshift(query1, -300))"
                }
                ]
            }
            ],
            "autoscale": false,
            "custom_unit": "%",
            "text_align": "center",
            "custom_links": [],
            "precision": 0
        }
        },
        {
        "id": 12,
        "layout": {
            "x": 0,
            "y": 66,
            "width": 51,
            "height": 15
        },
        "definition": {
            "title": "CPU system by image",
            "title_size": "16",
            "title_align": "left",
            "show_legend": false,
            "legend_size": "0",
            "time": {
            "live_span": "1h"
            },
            "type": "timeseries",
            "requests": [
            {
                "response_format": "timeseries",
                "queries": [
                {
                    "data_source": "metrics",
                    "name": "query1",
                    "query": "avg:docker.cpu.system{$scope} by {docker_image}.fill(0)"
                }
                ],
                "style": {
                "palette": "cool"
                },
                "display_type": "line"
            }
            ],
            "custom_links": []
        }
        },
        {
        "id": 13,
        "layout": {
            "x": 52,
            "y": 0,
            "width": 14,
            "height": 39
        },
        "definition": {
            "type": "note",
            "content": "\n\nContainers",
            "background_color": "blue",
            "font_size": "24",
            "text_align": "center",
            "show_tick": true,
            "tick_pos": "50%",
            "tick_edge": "right"
        }
        },
        {
        "id": 14,
        "layout": {
            "x": 52,
            "y": 82,
            "width": 51,
            "height": 15
        },
        "definition": {
            "title": "Cache memory by image",
            "title_size": "16",
            "title_align": "left",
            "show_legend": false,
            "legend_size": "0",
            "time": {
            "live_span": "1h"
            },
            "type": "timeseries",
            "requests": [
            {
                "response_format": "timeseries",
                "queries": [
                {
                    "data_source": "metrics",
                    "name": "query1",
                    "query": "sum:docker.mem.cache{$scope} by {docker_image}"
                }
                ],
                "display_type": "line"
            }
            ],
            "custom_links": []
        }
        },
        {
        "id": 15,
        "layout": {
            "x": 0,
            "y": 0,
            "width": 51,
            "height": 8
        },
        "definition": {
            "type": "image",
            "url": "/static/images/logos/docker_small.svg",
            "sizing": "fit"
        }
        },
        {
        "id": 16,
        "layout": {
            "x": 0,
            "y": 42,
            "width": 51,
            "height": 6
        },
        "definition": {
            "type": "note",
            "content": "[CPU Core Load](https://www.datadoghq.com/blog/how-to-monitor-docker-resource-metrics/#toc2)",
            "background_color": "blue",
            "font_size": "24",
            "text_align": "center",
            "show_tick": true,
            "tick_pos": "50%",
            "tick_edge": "bottom"
        }
        },
        {
        "id": 17,
        "layout": {
            "x": 52,
            "y": 42,
            "width": 51,
            "height": 6
        },
        "definition": {
            "type": "note",
            "content": "Memory",
            "background_color": "blue",
            "font_size": "24",
            "text_align": "center",
            "show_tick": true,
            "tick_pos": "50%",
            "tick_edge": "bottom"
        }
        },
        {
        "id": 18,
        "layout": {
            "x": 52,
            "y": 66,
            "width": 51,
            "height": 15
        },
        "definition": {
            "title": "Swap by image",
            "title_size": "16",
            "title_align": "left",
            "show_legend": false,
            "legend_size": "0",
            "time": {
            "live_span": "1h"
            },
            "type": "timeseries",
            "requests": [
            {
                "response_format": "timeseries",
                "queries": [
                {
                    "data_source": "metrics",
                    "name": "query1",
                    "query": "avg:docker.mem.swap{$scope} by {docker_image}"
                }
                ],
                "display_type": "line"
            }
            ],
            "custom_links": []
        }
        },
        {
        "id": 19,
        "layout": {
            "x": 156,
            "y": 42,
            "width": 51,
            "height": 6
        },
        "definition": {
            "type": "note",
            "content": "I/O",
            "background_color": "blue",
            "font_size": "24",
            "text_align": "center",
            "show_tick": true,
            "tick_pos": "50%",
            "tick_edge": "bottom"
        }
        },
        {
        "id": 20,
        "layout": {
            "x": 156,
            "y": 50,
            "width": 51,
            "height": 15
        },
        "definition": {
            "title": "Avg. I/O bytes read by image",
            "title_size": "16",
            "title_align": "left",
            "show_legend": false,
            "legend_size": "0",
            "time": {
            "live_span": "1h"
            },
            "type": "timeseries",
            "requests": [
            {
                "response_format": "timeseries",
                "queries": [
                {
                    "data_source": "metrics",
                    "name": "query1",
                    "query": "avg:docker.io.read_bytes{$scope} by {docker_image}"
                }
                ],
                "style": {
                "palette": "dog_classic"
                },
                "display_type": "area"
            }
            ],
            "custom_links": []
        }
        },
        {
        "id": 21,
        "layout": {
            "x": 156,
            "y": 66,
            "width": 51,
            "height": 15
        },
        "definition": {
            "title": "Avg. I/O bytes written by image",
            "title_size": "16",
            "title_align": "left",
            "show_legend": false,
            "legend_size": "0",
            "time": {
            "live_span": "1h"
            },
            "type": "timeseries",
            "requests": [
            {
                "response_format": "timeseries",
                "queries": [
                {
                    "data_source": "metrics",
                    "name": "query1",
                    "query": "avg:docker.io.write_bytes{$scope} by {docker_image}"
                }
                ],
                "style": {
                "palette": "dog_classic"
                },
                "display_type": "area"
            }
            ],
            "custom_links": []
        }
        },
        {
        "id": 22,
        "layout": {
            "x": 104,
            "y": 42,
            "width": 51,
            "height": 6
        },
        "definition": {
            "type": "note",
            "content": "Network",
            "background_color": "blue",
            "font_size": "24",
            "text_align": "center",
            "show_tick": true,
            "tick_pos": "50%",
            "tick_edge": "bottom"
        }
        },
        {
        "id": 23,
        "layout": {
            "x": 104,
            "y": 50,
            "width": 51,
            "height": 15
        },
        "definition": {
            "title": "Avg. rx bytes by image",
            "title_size": "16",
            "title_align": "left",
            "show_legend": false,
            "legend_size": "0",
            "time": {
            "live_span": "1h"
            },
            "type": "timeseries",
            "requests": [
            {
                "response_format": "timeseries",
                "queries": [
                {
                    "data_source": "metrics",
                    "name": "query1",
                    "query": "avg:docker.net.bytes_rcvd{$scope} by {docker_image}"
                }
                ],
                "style": {
                "palette": "cool"
                },
                "display_type": "area"
            }
            ],
            "custom_links": []
        }
        },
        {
        "id": 24,
        "layout": {
            "x": 104,
            "y": 66,
            "width": 51,
            "height": 15
        },
        "definition": {
            "title": "Avg. tx bytes by image",
            "title_size": "16",
            "title_align": "left",
            "show_legend": false,
            "legend_size": "0",
            "time": {
            "live_span": "1h"
            },
            "type": "timeseries",
            "requests": [
            {
                "response_format": "timeseries",
                "queries": [
                {
                    "data_source": "metrics",
                    "name": "query1",
                    "query": "avg:docker.net.bytes_sent{$scope} by {docker_image}"
                }
                ],
                "style": {
                "palette": "purple"
                },
                "display_type": "area"
            }
            ],
            "custom_links": []
        }
        },
        {
        "id": 25,
        "layout": {
            "x": 104,
            "y": 82,
            "width": 51,
            "height": 15
        },
        "definition": {
            "title": "Most tx-intensive containers",
            "title_size": "16",
            "title_align": "left",
            "time": {
            "live_span": "1h"
            },
            "type": "toplist",
            "requests": [
            {
                "style": {
                "palette": "purple"
                },
                "response_format": "scalar",
                "queries": [
                {
                    "data_source": "metrics",
                    "name": "query1",
                    "query": "avg:docker.net.bytes_sent{$scope} by {container_name}",
                    "aggregator": "max"
                }
                ],
                "formulas": [
                {
                    "formula": "query1",
                    "limit": {
                    "count": 5,
                    "order": "desc"
                    }
                }
                ]
            }
            ],
            "custom_links": []
        }
        },
        {
        "id": 26,
        "layout": {
            "x": 104,
            "y": 98,
            "width": 51,
            "height": 15
        },
        "definition": {
            "title": "tx by container",
            "title_size": "16",
            "title_align": "left",
            "show_legend": false,
            "legend_size": "0",
            "time": {
            "live_span": "1h"
            },
            "type": "heatmap",
            "custom_links": [],
            "requests": [
            {
                "response_format": "timeseries",
                "queries": [
                {
                    "data_source": "metrics",
                    "name": "query1",
                    "query": "avg:docker.net.bytes_sent{$scope} by {container_name}"
                }
                ]
            }
            ]
        }
        },
        {
        "id": 27,
        "layout": {
            "x": 119,
            "y": 0,
            "width": 36,
            "height": 39
        },
        "definition": {
            "title": "Running containers by image",
            "title_size": "16",
            "title_align": "left",
            "time": {
            "live_span": "1h"
            },
            "type": "toplist",
            "requests": [
            {
                "style": {
                "palette": "dog_classic"
                },
                "response_format": "scalar",
                "queries": [
                {
                    "data_source": "metrics",
                    "name": "query1",
                    "query": "sum:docker.containers.running{$scope} by {docker_image}.fill(60)",
                    "aggregator": "last"
                }
                ],
                "formulas": [
                {
                    "formula": "timeshift(query1, 40)",
                    "limit": {
                    "count": 20,
                    "order": "desc"
                    }
                }
                ]
            }
            ],
            "custom_links": []
        }
        }
    ],
    "template_variables": [
        {
        "name": "scope",
        "available_values": [],
        "default": "*"
        }
    ],
    "layout_type": "free",
    "notify_list": []
    }
    EOF
}