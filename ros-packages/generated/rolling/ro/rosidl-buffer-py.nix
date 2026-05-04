{
  ament-cmake,
  ament-cmake-python,
  ament-lint-auto,
  ament-lint-common,
  buildAmentCmakePackage,
  fetchgit,
  fetchurl,
  fetchzip,
  mkSourceSet,
  rosSystemPackages,
  rosidl-buffer,
  substituteSource,
}:
buildAmentCmakePackage (finalAttrs: {
  pname = "rosidl_buffer_py";
  version = "5.2.0-2";
  src = finalAttrs.passthru.sources."rosidl_buffer_py";
  nativeBuildInputs = [ ament-cmake ament-cmake-python ];
  propagatedNativeBuildInputs = [ rosidl-buffer ] ++ rosSystemPackages.getPackages { forNativeBuildInputs = [ "pybind11-dev" "python3-dev" ]; };
  buildInputs = [ ament-cmake ament-cmake-python ];
  propagatedBuildInputs = [ rosidl-buffer ] ++ rosSystemPackages.getPackages { forBuildInputs = [ "pybind11-dev" "python3-dev" ]; };
  checkInputs = [ ament-lint-auto ament-lint-common ];
  passthru.sources = mkSourceSet (sources: {
    "rosidl_buffer_py" = substituteSource {
      src = fetchgit {
        name = "rosidl_buffer_py-source";
        url = "https://github.com/ros2-gbp/rosidl-release.git";
        rev = "adbff881512e19019ff1fa6fc826773c00e65a68";
        hash = "sha256-L+OH0DcOl/bpW+6rAuNxWIevFl0LRghv+eMkzqDS+dE=";
      };
    };
  });
  meta = {
    description = "\n    Python bindings for rosidl::Buffer, providing a Buffer class that\n    supports vendor-specific memory backends (CPU, GPU, custom) for rclpy users.\n  ";
  };
})
