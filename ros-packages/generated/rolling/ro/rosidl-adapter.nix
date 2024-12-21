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
  version = "4.9.3-1";
  src = finalAttrs.passthru.sources."rosidl_adapter";
  propagatedNativeBuildInputs = [ ament-cmake ament-cmake-core rosidl-cli ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "python3" "python3-empy" ]; };
  propagatedBuildInputs = [ ament-cmake ament-cmake-core rosidl-cli ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "python3-empy" ]; };
  checkInputs = [ ament-cmake-mypy ament-cmake-pytest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_adapter" = substituteSource {
      src = fetchgit {
        name = "rosidl_adapter-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "f56ad708c30a853d1899cd4c41eef584380ab3c2";
        hash = "sha256-ytGD4jgpc6xgFER5U6tRz+3RAepj0/9C1W23P6OYlyk=";
      };
    };
  });
  meta = {
    description = "API and scripts to parse .msg/.srv/.action files and convert them to .idl.";
  };
})
