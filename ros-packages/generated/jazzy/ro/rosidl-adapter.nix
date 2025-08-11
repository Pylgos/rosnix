{
  ament-cmake,
  ament-cmake-core,
  ament-cmake-pytest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-cli,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_adapter";
  version = "4.6.6-1";
  src = finalAttrs.passthru.sources."rosidl_adapter";
  propagatedNativeBuildInputs = [ ament-cmake ament-cmake-core rosidl-cli ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" "python3-empy" ]; };
  propagatedBuildInputs = [ ament-cmake ament-cmake-core rosidl-cli ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" "python3-empy" ]; };
  checkInputs = [ ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_adapter" = substituteSource {
      src = fetchgit {
        name = "rosidl_adapter-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "58918e60f4dce1d6dba5bc178346d87d3a0fcf43";
        hash = "sha256-vuwdGrt6wUsGbMu1kIqStpsDjvY8fS0XQjI7x9AQwvg=";
      };
    };
  });
  meta = {
    description = "\n    API and scripts to parse .msg/.srv/.action files and convert them to .idl.\n  ";
  };
})
