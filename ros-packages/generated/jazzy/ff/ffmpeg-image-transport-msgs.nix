{
  ament-cmake,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-default-generators,
  rosidl-default-runtime,
  std-msgs,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "ffmpeg_image_transport_msgs" = substituteSource {
      src = fetchgit {
        name = "ffmpeg_image_transport_msgs-source";
        url = "https://github.com/ros2-gbp/ffmpeg_image_transport_msgs-release.git";
        rev = "27fad7bbaba75016c36e07b12364819edd074066";
        hash = "sha256-pqSfqQqwy2iI4Z76hMWtAkpmjCYHy0xa0SBqsE+X/dQ=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "ffmpeg-image-transport-msgs";
  version = "1.0.2-3";
  src = sources."ffmpeg_image_transport_msgs";
  nativeBuildInputs = [ ament-cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ rosidl-default-generators ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ rosidl-default-runtime std-msgs ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "messages for ffmpeg image transport plugin";
  };
}
