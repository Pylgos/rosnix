{
  ament-cmake-auto,
  ament-lint-auto,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  geometry-msgs,
  mkSourceSet,
  ouxt-lint-common,
  rclcpp,
  rosSystemPackages,
  std-msgs,
  substituteSource,
  visualization-msgs,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "fluent_rviz";
  version = "0.0.3-5";
  src = finalAttrs.passthru.sources."fluent_rviz";
  nativeBuildInputs = [ ament-cmake-auto ];
  propagatedNativeBuildInputs = [ rclcpp ];
  propagatedBuildInputs = [ geometry-msgs std-msgs visualization-msgs ];
  checkInputs = [ ament-lint-auto ouxt-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "fluent_rviz" = substituteSource {
      src = fetchgit {
        name = "fluent_rviz-source";
        url = "https://github.com/ros2-gbp/fluent_rviz-release.git";
        rev = "e271cd3172ef0ebd5a1c682f0443b893ee909caa";
        hash = "sha256-/LmzIiGEHhv+jlon28dyJAjyB233kvyupBzUS01rdjA=";
      };
    };
  });
  meta = {
    description = "A library which makes Rviz fluent. Powered by C++17";
  };
})
