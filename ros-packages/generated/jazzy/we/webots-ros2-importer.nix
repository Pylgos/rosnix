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
  propagatedNativeBuildInputs = [ builtin-interfaces xacro ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-collada" "python3-lark-parser" ]; };
  propagatedBuildInputs = [ builtin-interfaces xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-collada" "python3-lark-parser" ]; };
  checkInputs = [ ament-copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-pil" "python3-pycodestyle" "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "webots_ros2_importer" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_importer-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "60e93ce925b5678cb725d47464a65f68b63321c5";
        hash = "sha256-hyO9zwXiAuwnmksvQWgVUBFskFy3nq9/wVsdveT174o=";
      };
    };
  });
  meta = {
    description = "This package allows to convert URDF and XACRO files into Webots PROTO files.";
  };
})
