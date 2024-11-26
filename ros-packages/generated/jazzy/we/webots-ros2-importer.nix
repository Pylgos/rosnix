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
  version = "2023.1.3-1";
  src = finalAttrs.passthru.sources."webots_ros2_importer";
  propagatedNativeBuildInputs = rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3-lark-parser" ]; };
  propagatedBuildInputs = [ builtin-interfaces xacro ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-collada" ]; };
  checkInputs = [ ament-copyright ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-numpy" "python3-pil" "python3-pycodestyle" "python3-pytest" ]; };
  passthru = {
    sources = mkSourceSet (sources: {
      "webots_ros2_importer" = substituteSource {
        src = fetchgit {
          name = "webots_ros2_importer-source";
          url = "https://github.com/ros2-gbp/webots_ros2-release.git";
          rev = "ab7ad4c33c287904075a6bb56d13703b36c3b113";
          hash = "sha256-0BjkWBfT9UijOpEXMxJlQSl5ecFhKxV3II4hqj3MLsY=";
        };
      };
    });
  };
  meta = {
    description = "This package allows to convert URDF and XACRO files into Webots PROTO files.";
  };
})
