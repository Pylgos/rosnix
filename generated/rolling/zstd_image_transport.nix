{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  fetchFromGitHub,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = rec {
    zstd_image_transport = substituteSource {
      src = fetchFromGitHub {
        name = "zstd_image_transport-source";
        owner = "ros2-gbp";
        repo = "image_transport_plugins-release";
        rev = "d775711c353ee496a3d50616232ac8948824de91";
        hash = "sha256-2g76JUeoRwfu0yZmgms3vUD0fFcs4r8lzqmn71hv2Kc=";
      };
      substitutions = [
      ];
    };
  };
in
buildRosPackage {
  pname = "zstd_image_transport";
  version = "5.0.0-1";
  src = sources.zstd_image_transport;
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
