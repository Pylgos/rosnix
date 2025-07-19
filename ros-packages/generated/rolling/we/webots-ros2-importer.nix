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
  version = "2025.0.1-1";
  src = finalAttrs.passthru.sources."webots_ros2_importer";
  propagatedNativeBuildInputs = [ builtin-interfaces xacro ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-collada" "python3-lark-parser" ]; };
  propagatedBuildInputs = [ builtin-interfaces xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-collada" "python3-lark-parser" ]; };
  checkInputs = [ ament-copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-pil" "python3-pycodestyle" "python3-pytest" ]; };
  passthru.sources = mkSourceSet (sources: {
    "webots_ros2_importer" = substituteSource {
      src = fetchgit {
        name = "webots_ros2_importer-source";
        url = "https://github.com/ros2-gbp/webots_ros2-release.git";
        rev = "8249c2bc593df80788e3082a47d5911de37b463b";
        hash = "sha256-PAwMYU1SfTQxJSbv/Z7iNggm8QVaippcL13vBhUdNms=";
      };
    };
  });
  meta = {
    description = "This package allows to convert URDF and XACRO files into Webots PROTO files.";
  };
})
