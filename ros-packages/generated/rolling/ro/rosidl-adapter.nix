{
  ament-cmake,
  ament-cmake-core,
  ament-cmake-mypy,
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
  version = "5.2.0-2";
  src = finalAttrs.passthru.sources."rosidl_adapter";
  propagatedNativeBuildInputs = [ ament-cmake ament-cmake-core rosidl-cli ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" "python3-empy" ]; };
  propagatedBuildInputs = [ ament-cmake ament-cmake-core rosidl-cli ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3" "python3-empy" ]; };
  checkInputs = [ ament-cmake-mypy ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_adapter" = substituteSource {
      src = fetchgit {
        name = "rosidl_adapter-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "a0b5f72d55f8b234478d5facef95f832ba59797c";
        hash = "sha256-SWDzmUs6aBpOJaXMuBhbS2K4iDGd9najrkjop+GSaZU=";
      };
    };
  });
  meta = {
    description = "\n    API and scripts to parse .msg/.srv/.action files and convert them to .idl.\n  ";
  };
})
