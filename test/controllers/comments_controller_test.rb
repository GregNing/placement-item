require "test_helper"

class CommentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @campaign = campaigns(:one)
    @line_item = line_items(:one)
    @comment = comments(:one)
  end

  test 'should get index' do
    get line_item_comments_url(line_item_id: @line_item.id)
    assert_response :success
  end

  test 'should get new' do
    get new_line_item_comment_url(line_item_id: @line_item.id)
    assert_response :success
  end

  test 'should create comment' do
    assert_difference('Comment.count') do
      post "/line_items/#{@line_item.id}/comments", params: { comment: { name: @comment.name, content: @comment.content.body } }
    end

    assert_redirected_to line_item_comments_url(line_item_id: @line_item.id)
  end

  test 'should show comment' do
    get line_item_comment_url(line_item_id: @line_item.id, id: @comment.id)
    assert_response :success
  end

  test 'should get edit' do
    get edit_line_item_comment_url(line_item_id: @line_item.id, id: @comment.id)
    assert_response :success
  end

  test 'should update comment' do
    patch line_item_comment_url(line_item_id: @line_item.id, id: @comment.id), params: {
      comment: {
        name: @comment.name,
        content: '<div>Hello, from <strong>a fixture</strong></div>'
      }
    }
    assert_redirected_to line_item_comments_url(line_item_id: @line_item.id)
  end

  test 'should destroy comment' do
    assert_difference('Comment.count', -1) do
      delete line_item_comment_url(line_item_id: @line_item.id, id: @comment.id)
    end

    assert_redirected_to line_item_comments_url(line_item_id: @line_item.id)
  end
end
