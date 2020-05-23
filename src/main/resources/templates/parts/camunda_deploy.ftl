<div class="modal fade" id="deploymentModal" tabindex="-1" role="dialog" aria-labelledby="deploymentModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Загрузить новую схему</h5>
            </div>
            <div class="modal-body">
                <form method="post" enctype="multipart/form-data" action="/camunda/deploy/create">

                    <div class="form-group">
                        <label for="file">Example file input</label>
                        <input type="file" class="form-control-file" id="file" name="file">
                    </div>

                    <div class="form-group row">
                        <div class="col-sm-3">
                            <button type="submit" class="btn btn-primary">Сохранить</button>
                        </div>
                    </div>
                    <input type="hidden" name="_csrf" value="${_csrf.token}"/>
                </form>
            </div>
        </div>
    </div>
</div>