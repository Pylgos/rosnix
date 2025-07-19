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
  propagatedNativeBuildInputs = [ geometry-msgs rclcpp std-msgs visualization-msgs ];
  buildInputs = [ ament-cmake-auto ];
  propagatedBuildInputs = [ geometry-msgs rclcpp std-msgs visualization-msgs ];
  checkInputs = [ ament-lint-auto ouxt-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "fluent_rviz" = substituteSource {
      src = fetchgit {
        name = "fluent_rviz-source";
        url = "https://github.com/ros2-gbp/fluent_rviz-release.git";
        rev = "67d35d26e2001d8d46e83969a9a5e8cfa6ce3940";
        hash = "sha256-/LmzIiGEHhv+jlon28dyJAjyB233kvyupBzUS01rdjA=";
      };
    };
  });
  meta = {
    description = "A library which makes Rviz fluent. Powered by C++17";
  };
})
