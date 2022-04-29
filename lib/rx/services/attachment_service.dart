
import 'package:client/rx/services/rx_service.dart';
import 'package:client/types/schema/attachment_holder.dart';

class AttachmentService extends RxService{
  late List<AttachmentHolder> _attachments;

  List<AttachmentHolder> get attachments => _attachments;
  @override
  Future<void> onCreate() async{
    _attachments=[];
  }

  @override
  Future<void> onTerminate() async{
  }

}