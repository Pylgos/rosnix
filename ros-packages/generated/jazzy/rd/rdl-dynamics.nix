{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-cppcheck,
  ament-cmake-gtest,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-lint,
  buildAmentCmakePackage,
  eigen3-cmake-module,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rdl_dynamics";
  version = "6.0.0-1";
  src = finalAttrs.passthru.sources."rdl_dynamics";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ eigen3-cmake-module rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" "doxygen" "eigen" "graphviz" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ eigen3-cmake-module rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" "doxygen" "eigen" "graphviz" ]; };
  checkInputs = [ ament-cmake-clang-format ament-cmake-cppcheck ament-cmake-gtest ament-cmake-lint-cmake ament-cmake-xmllint ament-lint ];
  passthru.sources = mkSourceSet (sources: {
    "rdl_dynamics" = substituteSource {
      src = fetchgit {
        name = "rdl_dynamics-source";
        url = "https://github.com/jlack1987/rdl-release.git";
        rev = "2eb2fd355da1ad762567caf5d4ae97aff95b8c14";
        hash = "sha256-3DPkTW9hau6vIcDncZAiVMMcW3OAssJ8oKSINL6+kV0=";
      };
    };
  });
  meta = {
    description = "The rdl_dynamics package";
  };
})
