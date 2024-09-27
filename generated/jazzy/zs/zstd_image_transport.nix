{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    zstd_image_transport-47d2da12961d51de2f1e4eb27e52a0572bbb0538 = substituteSource {
      src = fetchgit {
        name = "zstd_image_transport-47d2da12961d51de2f1e4eb27e52a0572bbb0538-source";
        url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
        rev = "47d2da12961d51de2f1e4eb27e52a0572bbb0538";
        hash = "sha256-a89xsgpPLTCSHzmuCR9v9YSmwzqnkW8LZtkTznUez4Q=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "zstd_image_transport";
  version = "4.0.2-1";
  src = sources.zstd_image_transport-47d2da12961d51de2f1e4eb27e52a0572bbb0538;
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ image_transport ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "zlib" ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "zstd_image_transport provides a plugin to image_transport for transparently sending images encoded as zstd blobs";
  };
}
