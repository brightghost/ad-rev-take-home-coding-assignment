import React, { Component } from 'react';
import { Link } from 'react-router-dom';

class TopPaths extends Component {

    constructor(props) {
        super(props);
        this.state = {paths: [], isLoading: true, error: null};
    }

    componentDidMount() {
        fetch('/api/v1/conversions/top-paths?advertiserId=adv-demo-001&limit=5')
            .then(response => {
                if (!response.ok) {
                    return response.text().then(text => {
                        throw new Error(`API error ${response.status}: ${text}`);
                    });
                }
                return response.json();
            })
            .then(data => {
                if (!Array.isArray(data)) {
                    throw new Error('Expected top-paths to return an array');
                }
                this.setState({paths: data, isLoading: false});
            })
            .catch(error => this.setState({error: error.message, isLoading: false}));
    }
        //  example:
        //  [
        //   {
        //     "rank": 1,
        //     "path": ["GOOGLE", "META", "DIRECT"],
        //     "conversions": 12,
        //     "percentage": 100.0
        //   },
        //   {
        //     "rank": 2,
        //     "path": ["PROGRAMMATIC", "GOOGLE"],
        //     "conversions": 8,
        //     "percentage": 66.7
        //   },
        //   {
        //     "rank": 3,
        //     "path": ["META", "PROGRAMMATIC", "GOOGLE", "DIRECT"],
        //     "conversions": 6,
        //     "percentage": 50.0
        //   },
        //   {
        //     "rank": 4,
        //     "path": ["GOOGLE", "DIRECT"],
        //     "conversions": 6,
        //     "percentage": 50.0
        //   },
        //   {
        //     "rank": 5,
        //     "path": ["DIRECT"],
        //     "conversions": 5,
        //     "percentage": 41.7
        //   }
        // ]

    render() {
        const {paths, isLoading, error} = this.state;

        if (isLoading) {
            return <p>Loading...</p>;
        }

        if (error) {
            return <p>Error: {error}</p>;
        }

        const pathList = paths.map((path, index) => {
            return <tr key={index}>
                <td style={{whiteSpace: 'nowrap'}}>{Array.isArray(path.path) ? path.path.join(' → ') : path.path}</td>
                <td>{path.conversions}</td>
                <td>{path.percentage}</td>

            </tr>
        });

        return (
            <div>


                    <h3>Top Paths</h3>
                    <table>
                        <thead>
                        <tr>
                            <th width="30%">Name</th>
                            <th width="30%">Email</th>
                            <th width="40%">Actions</th>
                        </tr>
                        </thead>
                        <tbody>
                        {pathList}
                        </tbody>
                    </table>

            </div>
        );
    }}
export default TopPaths;

