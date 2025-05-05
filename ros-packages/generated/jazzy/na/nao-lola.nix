{
  ament-cmake,
  ament-cmake-gtest,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  nao-command-msgs,
  nao-sensor-msgs,
  rclcpp,
  rosSystemPackages,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "nao_lola";
  version = "1.3.0-2";
  src = finalAttrs.passthru.sources."nao_lola";
  nativeBuildInputs = [ ament-cmake ];
  propagatedNativeBuildInputs = [ nao-command-msgs nao-sensor-msgs rclcpp ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "boost" ]; };
  buildInputs = [ ament-cmake ];
  propagatedBuildInputs = [ nao-command-msgs nao-sensor-msgs rclcpp ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "boost" ]; };
  checkInputs = [ ament-cmake-gtest ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "nao_lola" = substituteSource {
      src = fetchgit {
        name = "nao_lola-source";
        url = "https://github.com/ros2-gbp/nao_lola-release.git";
        rev = "8a20246aaa40a9b39b647fca378090da73caa4cc";
        hash = "sha256-4PYS6ui19PLLdGv3RK/Yocfe4mLcF7codg2N1R+L2NM=";
      };
    };
  });
  meta = {
    description = "Packages that allow communicating with the NAO's Lola middle-ware.";
  };
})
