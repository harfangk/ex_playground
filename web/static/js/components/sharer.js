import React from 'react'
import ReactDOM from 'react-dom'

export default class Sharer extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      content: this.getContent(props)
    }
  }

  componentDidMount(prevProps, prevState) {
    this.selectContent();
  }

  componentDidUpdate(prevProps, prevState) {
    if (this.props.shareURL || this.props.embedCode) {
      this.selectContent();
    }
  }

  componentWillReceiveProps(nextProps) {
    this.setState({
      content: this.getContent(nextProps)
    });
  }

  render() {
    return (
      <form className="form-inline navbar__sharer">
        <input type="text" ref="shareInput"
          className="form-control navbar__sharer__input"
          value={this.state.content}
          readOnly autoFocus />
      </form>
    );
  }

  getContent(props) {
    var content = props.showEmbedCode ? this.props.embedCode : this.props.shareURL;
    return content;
  }

  selectContent() {
    ReactDOM.findDOMNode(this.refs.shareInput).select();
  }
};

Sharer.propTypes = {
  shareURL: React.PropTypes.string,
  embedCode: React.PropTypes.string,
  showEmbedCode: React.PropTypes.bool
}
