{
  ament-cmake-core,
  ament-cmake-ros,
  ament-index-python,
  ament-lint-auto,
  ament-lint-common,
  buildRosPackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mimick-vendor,
  mkSourceSet,
  performance-test-fixture,
  rcpputils,
  rcutils,
  rosSystemPackages,
  rosidl-cli,
  rosidl-generator-c,
  rosidl-pycommon,
  rosidl-runtime-c,
  rosidl-typesupport-fastrtps-c,
  rosidl-typesupport-interface,
  rosidl-typesupport-introspection-c,
  substituteSource,
}:
let
  sources = mkSourceSet (sources: {
    "rosidl_typesupport_c" = substituteSource {
      src = fetchgit {
        name = "rosidl_typesupport_c-source";
        url = "https://github.com/ros2-gbp/rosidl_typesupport-release.git";
        rev = "5dea37cf7a79d5651289f3f65380399f15febf5d";
        hash = "sha256-JCYXTlvnyR+O2YgS8alsztQk5kBOkkxeZ86LyuTNIbw=";
      };
      substitutions = [
      ];
    };
  });
in
buildRosPackage {
  pname = "rosidl_typesupport_c";
  version = "3.2.2-1";
  src = sources."rosidl_typesupport_c";
  nativeBuildInputs = [ ament-cmake-ros ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [  ]; };
  propagatedNativeBuildInputs = [ ament-cmake-core rosidl-cli rosidl-generator-c rosidl-pycommon ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" ]; };
  buildInputs = [  ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  propagatedBuildInputs = [ ament-index-python rcpputils rcutils rosidl-runtime-c rosidl-typesupport-fastrtps-c rosidl-typesupport-interface rosidl-typesupport-introspection-c ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  depsTargetTarget = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  depsTargetTargetPropagated = [  ] ++ rosSystemPackages.getPackages { forDepsTargetTarget = [  ]; };
  checkInputs = [ ament-lint-auto ament-lint-common mimick-vendor performance-test-fixture ] ++ rosSystemPackages.getPackages { forBuildInputs = [  ]; };
  meta = {
    description = "Generate the type support for C messages.";
  };
}
