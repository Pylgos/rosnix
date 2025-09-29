{
  ament-cmake,
  ament-cmake-clang-format,
  ament-cmake-cppcheck,
  ament-cmake-gtest,
  ament-cmake-lint-cmake,
  ament-cmake-xmllint,
  ament-index-cpp,
  ament-lint,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rclcpp,
  rdl-dynamics,
  rosSystemPackages,
  substituteSource,
  tinyxml-vendor,
  urdf,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rdl_urdfreader";
  version = "6.0.0-1";
  src = finalAttrs.passthru.sources."rdl_urdfreader";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ rclcpp rdl-dynamics tinyxml-vendor urdf ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "tinyxml" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ rclcpp rdl-dynamics tinyxml-vendor urdf ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "tinyxml" ]; };
  checkInputs = [ ament-cmake-clang-format ament-cmake-cppcheck ament-cmake-gtest ament-cmake-lint-cmake ament-cmake-xmllint ament-index-cpp ament-lint ];
  passthru.sources = mkSourceSet (sources: {
    "rdl_urdfreader" = substituteSource {
      src = fetchgit {
        name = "rdl_urdfreader-source";
        url = "https://github.com/jlack1987/rdl-release.git";
        rev = "96a0b805181bb03bcdac385a6924d6f19b5fceb2";
        hash = "sha256-mCJoMiLNduCpeM8zlozogt/7g2i4FA6vTbfJmAir/FY=";
      };
    };
  });
  meta = {
    description = "The rdl_urdfreader package";
  };
})
