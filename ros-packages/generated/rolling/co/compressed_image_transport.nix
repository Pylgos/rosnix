{
  ament_cmake,
  ament_lint_auto,
  ament_lint_common,
  buildRosPackage,
  cv_bridge,
  fetchgit,
  fetchurl,
  fetchzip,
  image_transport,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "compressed_image_transport" = substituteSource {
      src = fetchgit {
        name = "compressed_image_transport-source";
        url = "https://github.com/ros2-gbp/image_transport_plugins-release.git";
        rev = "32f3daf060cb0a5b082c8ccaa8643925187d3c68";
        hash = "sha256-T7LAhII99FErU+VqDUMj5klUIVpVDieo4Rj/qRls+QY=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "compressed_image_transport";
  version = "5.0.0-1";
  src = sources."compressed_image_transport";
  nativeBuildInputs = [ ament_cmake ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [  ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ cv_bridge image_transport ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament_lint_auto ament_lint_common ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Compressed_image_transport provides a plugin to image_transport for transparently sending images encoded as JPEG or PNG.";
  };
}
