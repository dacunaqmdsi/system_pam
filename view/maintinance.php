<?php include "components/header.php"; ?>

<!-- Page Wrapper -->
<div class="max-w-7xl mx-auto px-4 sm:px-6 lg:px-8 py-6 space-y-8">

    <!-- Top Bar with Title and User Info -->
    <div class="flex justify-between items-center bg-white p-4 rounded-xl shadow">
        <h2 class="text-2xl font-semibold text-gray-800">Maintenance</h2>
        <div class="flex items-center space-x-3">
            <?php
            $userImage = !empty($On_Session[0]['profile_picture']) ? $On_Session[0]['profile_picture'] : null;
            ?>
            <div class="w-10 h-10 rounded-full overflow-hidden bg-gray-200 flex items-center justify-center text-gray-600">
                <?php if ($userImage): ?>
                    <img src="../uploads/images/<?php echo $userImage; ?>" alt="User Avatar" class="w-full h-full object-cover">
                <?php else: ?>
                    <span class="material-icons text-3xl">account_circle</span>
                <?php endif; ?>
            </div>
            <span class="text-gray-700 font-medium">
                <?php echo ucfirst($On_Session[0]['fullname']); ?>
            </span>
        </div>
    </div>

    <button id="addAssetsButton" class="bg-red-500 text-white py-2 px-4 text-sm rounded-lg flex items-center hover:bg-red-600 transition duration-300 mb-4">
        <span class="material-icons mr-2 text-base">add</span>
        Add Assets
    </button>

    <!-- Modal for Adding Promo -->
    <div id="addAssetsModal" class="fixed inset-0 bg-gray-900 bg-opacity-50 flex items-center justify-center" style="display:none;">
        <div class="bg-white rounded-lg shadow-lg w-[40rem] max-h-[80vh] overflow-y-auto p-6">
            <h3 class="text-lg font-semibold text-gray-800 mb-4">Add New Assets</h3>
            <form id="addAssetFrm">

                <!-- Spinner -->
                <div class="spinner" id="spinner" style="display:none;">
                    <div class="absolute inset-0 bg-white bg-opacity-75 flex items-center justify-center">
                        <div class="w-10 h-10 border-4 border-indigo-500 border-t-transparent rounded-full animate-spin"></div>
                    </div>
                </div>



                <div class="mb-4">
                    <label for="add_assets_img" class="block text-sm font-medium text-gray-700">Assets Image</label>
                    <input type="file" id="add_assets_img" name="assets_img" class="w-full p-2 border rounded-md">
                </div>

                <div class="mb-4">
                    <label for="add_assets_code" class="block text-sm font-medium text-gray-700">Asset ID</label>
                    <input type="text" id="add_assets_code" name="assets_code" class="w-full p-2 border rounded-md" required>
                </div>

                <div class="mb-4">
                    <label for="add_assets_name" class="block text-sm font-medium text-gray-700">Name</label>
                    <input type="text" id="add_assets_name" name="assets_name" class="w-full p-2 border rounded-md" required>
                </div>


                <div class="mb-4">
                    <label for="add_assets_description" class="block text-sm font-medium text-gray-700">Description</label>
                    <textarea id="add_assets_description" name="assets_description" class="w-full p-2 border rounded-md" rows="2"></textarea>
                </div>


                <div class="mb-4">
                    <label for="add_assets_price" class="block text-sm font-medium text-gray-700">Price</label>
                    <input type="text" id="add_assets_price" name="assets_price" class="w-full p-2 border rounded-md" required>
                </div>




                <div class="mb-4">
                    <label for="add_assets_Office" class="block text-sm font-medium text-gray-700">Office</label>
                    <select name="assets_Office" id="add_assets_Office" class="w-full p-2 border rounded-md" required>
                        <option value="">Select Office</option>
                        <?php
                        $fetch_all_subcategory = $db->fetch_all_office();
                        if ($fetch_all_subcategory->num_rows > 0):
                            while ($subcategory = $fetch_all_subcategory->fetch_assoc()):
                        ?>

                                <option value="<?= $subcategory['id'] ?>"><?= $subcategory['office_name'] ?></option>

                            <?php endwhile; ?>
                        <?php else: ?>
                            <tr>
                                <td colspan="9" class="p-2 text-center">No record found.</td>
                            </tr>
                        <?php endif; ?>
                    </select>
                </div>





                <div class="mb-4">
                    <label for="add_assets_category" class="block text-sm font-medium text-gray-700">Category</label>
                    <select name="assets_category" id="add_assets_category" class="w-full p-2 border rounded-md" required>
                        <option value="">Select Category</option>
                        <?php
                        $fetch_all_category = $db->fetch_all_category();
                        if ($fetch_all_category->num_rows > 0):
                            while ($category = $fetch_all_category->fetch_assoc()):
                        ?>

                                <option value="<?= $category['id'] ?>"><?= $category['category_name'] ?></option>

                            <?php endwhile; ?>
                        <?php else: ?>
                            <tr>
                                <td colspan="9" class="p-2 text-center">No record found.</td>
                            </tr>
                        <?php endif; ?>
                    </select>
                </div>

                <script>
                    function show_p(id) {
                        const paperFields = [
                            document.getElementById("size").parentElement,
                            document.getElementById("brand").parentElement,
                            document.getElementById("unit").parentElement,
                            document.getElementById("paper_type").parentElement,
                            document.getElementById("thickness").parentElement
                        ];

                        if (id == 36) {
                            paperFields.forEach(field => field.hidden = false);
                        } else {
                            paperFields.forEach(field => field.hidden = true);
                        }
                    }
                </script>



                <div class="mb-4">
                    <label for="add_assets_subcategory" class="block text-sm font-medium text-gray-700">Subcategory</label>
                    <select onclick="show_p(this.value);" name="assets_subcategory" id="add_assets_subcategory" class="w-full p-2 border rounded-md" required>
                        <option value="">Select Subcategory</option>
                        <?php
                        $fetch_all_subcategory = $db->fetch_all_subcategory();
                        if ($fetch_all_subcategory->num_rows > 0):
                            while ($subcategory = $fetch_all_subcategory->fetch_assoc()):
                        ?>

                                <option data-category_id="<?= $subcategory['category_id'] ?>" value="<?= $subcategory['id'] ?>"><?= $subcategory['subcategory_name'] ?></option>

                            <?php endwhile; ?>
                        <?php else: ?>
                            <tr>
                                <td colspan="9" class="p-2 text-center">No record found.</td>
                            </tr>
                        <?php endif; ?>
                    </select>
                </div>

                <!--  -->
                <!--  -->
                <!--  -->
                <!--  -->
                <!--  -->
                <!--  -->
                <!--  -->
                <div hidden class="mb-4">
                    <label for="size">Size</label>
                    <select name="size" id="size" class="w-full p-2 border rounded-md">
                        <option value="">Select Size if any</option>
                        <option value="Short">Short</option>
                        <option value="Long">Long</option>
                        <option value="A4">A4</option>
                        <option value="A3">A3</option>
                        <option value="Letter">Letter</option>
                        <option value="Legal">Legal</option>
                        <option value="Tabloid">Tabloid</option>
                        <!-- Add more sizes as required -->
                    </select>
                </div>

                <div hidden class="mb-4">
                    <label for="brand">Brand</label>
                    <select name="brand" id="brand" class="w-full p-2 border rounded-md">
                        <option value="">Select Brand if any</option>
                        <option value="Hardcopy">Hardcopy</option>
                        <option value="Brand1">Brand1</option>
                        <option value="Brand2">Brand2</option>
                        <option value="Brand3">Brand3</option>
                        <!-- Add more brands as required -->
                    </select>
                </div>

                <div hidden class="mb-4">
                    <label for="unit">Quantity (Unit)</label>
                    <select name="unit" id="unit" class="w-full p-2 border rounded-md">
                        <option value="">Select Unit if any</option>
                        <option value="PC">Piece (PC)</option>
                        <option value="Ream">Ream</option>
                        <option value="Box">Box</option>
                        <option value="Pack">Pack</option>
                        <!-- Add more units as required -->
                    </select>
                </div>

                <div hidden class="mb-4">
                    <label for="paper_type">Paper Type</label>
                    <select name="paper_type" id="paper_type" class="w-full p-2 border rounded-md">
                        <option value="">Select Paper Type if any</option>
                        <option value="Copier">Copier</option>
                        <option value="Multipurpose">Multipurpose</option>
                        <option value="Digital">Digital</option>
                        <option value="Glossy">Glossy</option>
                        <option value="Matte">Matte</option>
                        <!-- Add more paper types as required -->
                    </select>
                </div>

                <div hidden class="mb-4">
                    <label for="thickness">Thickness</label>
                    <select name="thickness" id="thickness" class="w-full p-2 border rounded-md">
                        <option value="">Select Thickness if any</option>
                        <option value="70gsm">70gsm</option>
                        <option value="80gsm">80gsm</option>
                        <option value="90gsm">90gsm</option>
                        <option value="100gsm">100gsm</option>
                        <option value="120gsm">120gsm</option>
                        <!-- Add more thickness options as required -->
                    </select>
                </div>
                <!--  -->
                <!--  -->
                <!--  -->
                <!--  -->
                <!--  -->
                <!--  -->
                <!--  -->


                <div class="mb-4">
                    <label for="add_assets_condition" class="block text-sm font-medium text-gray-700">Condition</label>
                    <select name="assets_condition" id="add_assets_condition" class="w-full p-2 border rounded-md" required>
                        <option value="New">New</option>
                        <option value="Good">Good</option>
                        <option value="Needs Repair">Needs Repair</option>
                        <option value="Damaged">Damaged</option>
                    </select>
                </div>


                <div class="mb-4">
                    <label for="add_assets_status" class="block text-sm font-medium text-gray-700">Status</label>
                    <select name="assets_status" id="add_assets_status" class="w-full p-2 border rounded-md" required>
                        <option value="Available">Available</option>
                        <option value="Assigned">Assigned</option>
                        <option value="Under Maintenance">Under Maintenance</option>
                        <option value="Disposed">Disposed</option>
                    </select>
                </div>




                <div class="mb-4">
                    <label for="assets_variety_name" class="block text-sm font-medium text-gray-700">Variety Name</label>
                    <input type="text" id="assets_variety_name" name="assets_variety_name" class="w-full p-2 border rounded-md" required>
                </div>

                <div class="mb-4">
                    <label for="assets_variety_value" class="block text-sm font-medium text-gray-700">Variety Value</label>
                    <div id="variety-values-container">
                        <input type="text" name="assets_variety_value[]" class="w-full p-2 mb-2 border rounded-md" required>
                    </div>
                    <button type="button" class="add-variety-value mt-2 text-blue-500">Add Another Variety Value</button>
                </div>



                <div class="flex justify-end gap-2">
                    <button type="button" class="addUserModalClose bg-gray-500 hover:bg-gray-600 text-white py-1 px-3 rounded-md">Cancel</button>
                    <button id="btnAddAssets" type="submit" class="bg-red-500 hover:bg-red-600 text-white py-1 px-3 rounded-md">Add new</button>
                </div>
            </form>
        </div>
    </div>


    <!-- System Settings Form -->
    <div class="bg-white rounded-xl shadow p-6">
        <h2 class="text-xl font-semibold text-gray-800 mb-4">System Settings</h2>
        <form id="frmMaintenance" class="space-y-6">
            <!-- Logo Upload -->
            <div>
                <label for="logo" class="block text-sm font-medium text-gray-700">Logo</label>
                <input type="file" id="logo" name="system_logo"
                    class="mt-1 block w-full border border-gray-300 rounded-md px-3 py-2 shadow-sm focus:outline-none focus:ring-2 focus:ring-red-500 focus:border-red-500 sm:text-sm">
            </div>

            <!-- System Name -->
            <div>
                <label for="system_name" class="block text-sm font-medium text-gray-700">System Name</label>
                <input type="text" id="system_name" name="system_name" value="<?= $maintenance['system_name'] ?>"
                    class="mt-1 block w-full border border-gray-300 rounded-md px-3 py-2 shadow-sm focus:outline-none focus:ring-2 focus:ring-red-500 focus:border-red-500 sm:text-sm"
                    placeholder="Enter system name">
            </div>

            <!-- Save Button -->
            <div class="flex justify-end">
                <button type="submit" id="BtnMaintenance"
                    class="inline-flex items-center px-6 py-2 bg-red-600 text-white font-semibold rounded-md shadow hover:bg-red-700 focus:outline-none focus:ring-2 focus:ring-red-500">
                    Save Changes
                </button>
            </div>
        </form>
    </div>

</div>

<!-- Search Function -->
<script>
    $(document).ready(function() {
        $("#searchInput").on("keyup", function() {
            const value = $(this).val().toLowerCase();
            $("#userTable tbody tr").filter(function() {
                $(this).toggle($(this).text().toLowerCase().indexOf(value) > -1);
            });
        });
    });
</script>

<?php include "components/footer.php"; ?>