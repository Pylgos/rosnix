{
  ament-copyright,
  buildAmentPythonPackage,
  builtin-interfaces,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  substituteSource,
  xacro,
}:
buildAmentPythonPackage (finalAttrs: {
  pname = "webots_ros2_importer";
  version = "2025.0.0-1";
  src = finalAttrs.passthru.sources."webots_ros2_importer";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-lark-parser" ]; };
  propagatedBuildInputs = [ builtin-interfaces xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-collada" ]; };
  checkInputs = [ ament-copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-pil" "python3-pycodestyle" "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "webots_ros2_importer" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_importer-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "6ca3cb357f73d2d63474ad271d5b1eb48389d130";
        hash = "sha256-hyO9zwXiAuwnmksvQWgVUBFskFy3nq9/wVsdveT174o=";
      };
    };
  });
  meta = {
    description = "This package allows to convert URDF and XACRO files into Webots PROTO files.";
  };
})
