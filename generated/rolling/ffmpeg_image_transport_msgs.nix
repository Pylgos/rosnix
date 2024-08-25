{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  rosidl_default_generators,
  rosidl_default_runtime,
  std_msgs,
  substituteSource,
}:
let
  sources = rec {
    ffmpeg_image_transport_msgs = substituteSource {
      src = fetchgit {
        name = "ffmpeg_image_transport_msgs-source";
        url = "https://github.com/ros2-gbp/ffmpeg_image_transport_msgs-release.git";
        rev = "b085e3765bada63bf8b77222d6587dd5632b7537";
        hash = "sha256-pqSfqQqwy2iI4Z76hMWtAkpmjCYHy0xa0SBqsE+X/dQ=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "ffmpeg_image_transport_msgs";
  version = "1.0.2-2";
  src = sources.ffmpeg_image_transport_msgs;
  nativeBuildInputs = [ ament_cmake ];
  propagatedNativeBuildInputs = [ rosidl_default_generators ];
  buildInputs = [  ];
  propagatedBuildInputs = [ rosidl_default_runtime std_msgs ];
  depsTargetTarget = [  ];
  depsTargetTargetPropagated = [  ];
  checkInputs = [ ament_lint_auto ament_lint_common ];
  missingDependencies = [  ];
  meta = {
    description = "messages for ffmpeg image transport plugin";
  };
}
