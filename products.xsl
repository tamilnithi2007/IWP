<?xml version="1.0" encoding="UTF-8"?>

<xsl:stylesheet
    version="1.0"
    xmlns:xsl="http://www.w3.org/1999/XSL/Transform">


    <!-- =====================================================
                         MAIN TEMPLATE
    ====================================================== -->

    <xsl:template match="/">

        <html lang="en">

        <head>

            <meta charset="UTF-8"/>

            <meta
                name="viewport"
                content="width=device-width, initial-scale=1.0"/>

            <title>Product Inventory Dashboard</title>


            <!-- ================= CSS ================= -->

            <style>

                * {
                    box-sizing: border-box;
                }

                body {
                    margin: 0;
                    font-family: "Segoe UI", Arial, sans-serif;
                    background: #f1f5f9;
                    color: #1e293b;
                }


                /* ---------- Header ---------- */

                .header {
                    background:
                        linear-gradient(
                            135deg,
                            #0f172a,
                            #1e3a8a,
                            #2563eb
                        );

                    color: white;
                    padding: 55px 20px;
                    text-align: center;
                }

                .header h1 {
                    margin: 0;
                    font-size: 38px;
                    font-weight: 800;
                }

                .header p {
                    margin: 12px 0 0;
                    color: #dbeafe;
                    font-size: 16px;
                }


                /* ---------- Container ---------- */

                .container {
                    width: 92%;
                    max-width: 1200px;
                    margin: 40px auto;
                }


                /* ---------- Statistics ---------- */

                .stats {
                    display: grid;
                    grid-template-columns:
                        repeat(3, 1fr);

                    gap: 20px;
                    margin-bottom: 30px;
                }

                .stat-card {
                    background: white;
                    padding: 25px;
                    border-radius: 15px;

                    box-shadow:
                        0 8px 25px
                        rgba(15, 23, 42, 0.08);

                    text-align: center;
                }

                .stat-card h3 {
                    margin: 0;
                    color: #2563eb;
                    font-size: 30px;
                }

                .stat-card p {
                    margin: 7px 0 0;
                    color: #64748b;
                }


                /* ---------- Table Card ---------- */

                .table-card {
                    background: white;
                    border-radius: 18px;

                    box-shadow:
                        0 10px 30px
                        rgba(15, 23, 42, 0.08);

                    overflow: hidden;
                }

                .table-header {
                    padding: 25px 30px;

                    border-bottom:
                        1px solid #e2e8f0;
                }

                .table-header h2 {
                    margin: 0;
                    color: #0f172a;
                }

                .table-header p {
                    margin: 7px 0 0;
                    color: #64748b;
                }


                /* ---------- Table ---------- */

                .table-wrapper {
                    overflow-x: auto;
                }

                table {
                    width: 100%;
                    border-collapse: collapse;
                }

                th {
                    background: #eff6ff;
                    color: #1e3a8a;
                    padding: 16px;
                    text-align: left;
                    font-size: 14px;
                    text-transform: uppercase;
                    letter-spacing: 0.5px;
                }

                td {
                    padding: 17px 16px;
                    border-top:
                        1px solid #e2e8f0;
                }

                tr {
                    transition: 0.2s;
                }

                tbody tr:hover {
                    background: #f8fafc;
                }


                /* ---------- Product Name ---------- */

                .product-name {
                    font-weight: 700;
                    color: #0f172a;
                }

                .product-id {
                    color: #64748b;
                    font-size: 13px;
                }


                /* ---------- Price ---------- */

                .price {
                    font-weight: 700;
                    color: #16a34a;
                }


                /* ---------- Stock ---------- */

                .stock {
                    font-weight: 600;
                }

                .stock-high {
                    color: #15803d;
                }

                .stock-low {
                    color: #d97706;
                }

                .stock-zero {
                    color: #dc2626;
                }


                /* ---------- Status Badges ---------- */

                .badge {
                    display: inline-block;
                    padding: 7px 12px;
                    border-radius: 20px;

                    font-size: 12px;
                    font-weight: 700;
                }

                .badge-green {
                    background: #dcfce7;
                    color: #166534;
                }

                .badge-orange {
                    background: #ffedd5;
                    color: #9a3412;
                }

                .badge-red {
                    background: #fee2e2;
                    color: #991b1b;
                }


                /* ---------- Footer ---------- */

                footer {
                    margin-top: 50px;
                    background: #020617;
                    color: #94a3b8;
                    padding: 25px;
                    text-align: center;
                }

                footer strong {
                    color: white;
                }


                /* ---------- Responsive Design ---------- */

                @media (max-width: 768px) {

                    .header h1 {
                        font-size: 30px;
                    }

                    .stats {
                        grid-template-columns: 1fr;
                    }

                    .container {
                        width: 95%;
                    }

                }

            </style>

        </head>


        <body>


            <!-- =================================================
                              HEADER
            ================================================== -->

            <header class="header">

                <h1>
                    Product Inventory Dashboard
                </h1>

                <p>
                    XML Data transformed into a responsive HTML layout using XSLT
                </p>

            </header>


            <!-- =================================================
                              MAIN CONTENT
            ================================================== -->

            <main class="container">


                <!-- ================= STATISTICS ================= -->

                <div class="stats">

                    <div class="stat-card">

                        <h3>
                            <xsl:value-of
                                select="count(products/product)"/>
                        </h3>

                        <p>
                            Total Products
                        </p>

                    </div>


                    <div class="stat-card">

                        <h3>
                            <xsl:value-of
                                select="sum(products/product/quantity)"/>
                        </h3>

                        <p>
                            Total Units
                        </p>

                    </div>


                    <div class="stat-card">

                        <h3>
                            <xsl:value-of
                                select="count(products/product[quantity &gt; 0])"/>
                        </h3>

                        <p>
                            Available Products
                        </p>

                    </div>

                </div>



                <!-- ================= PRODUCT TABLE ================= -->

                <div class="table-card">


                    <div class="table-header">

                        <h2>
                            Product Information
                        </h2>

                        <p>
                            Complete inventory details
                        </p>

                    </div>


                    <div class="table-wrapper">

                        <table>


                            <thead>

                                <tr>

                                    <th>
                                        ID
                                    </th>

                                    <th>
                                        Product
                                    </th>

                                    <th>
                                        Category
                                    </th>

                                    <th>
                                        Price
                                    </th>

                                    <th>
                                        Quantity
                                    </th>

                                    <th>
                                        Status
                                    </th>

                                </tr>

                            </thead>


                            <tbody>


                                <!-- ================= XSLT LOOP ================= -->

                                <xsl:for-each
                                    select="products/product">


                                    <tr>


                                        <!-- Product ID -->

                                        <td>

                                            <span class="product-id">

                                                #
                                                <xsl:value-of
                                                    select="id"/>

                                            </span>

                                        </td>


                                        <!-- Product Name -->

                                        <td>

                                            <div class="product-name">

                                                <xsl:value-of
                                                    select="name"/>

                                            </div>

                                        </td>


                                        <!-- Category -->

                                        <td>

                                            <xsl:value-of
                                                select="category"/>

                                        </td>


                                        <!-- Price -->

                                        <td>

                                            <span class="price">

                                                ₹
                                                <xsl:value-of
                                                    select="price"/>

                                            </span>

                                        </td>


                                        <!-- Quantity -->

                                        <td>

                                            <span class="stock">

                                                <xsl:attribute name="class">

                                                    stock

                                                    <xsl:choose>

                                                        <xsl:when
                                                            test="quantity = 0">
                                                            stock-zero
                                                        </xsl:when>

                                                        <xsl:when
                                                            test="quantity &lt; 10">
                                                            stock-low
                                                        </xsl:when>

                                                        <xsl:otherwise>
                                                            stock-high
                                                        </xsl:otherwise>

                                                    </xsl:choose>

                                                </xsl:attribute>

                                                <xsl:value-of
                                                    select="quantity"/>

                                            </span>

                                        </td>


                                        <!-- Status -->

                                        <td>

                                            <span class="badge">

                                                <xsl:attribute name="class">

                                                    badge

                                                    <xsl:choose>

                                                        <xsl:when
                                                            test="status = 'In Stock'">
                                                            badge-green
                                                        </xsl:when>

                                                        <xsl:when
                                                            test="status = 'Limited Stock'">
                                                            badge-orange
                                                        </xsl:when>

                                                        <xsl:otherwise>
                                                            badge-red
                                                        </xsl:otherwise>

                                                    </xsl:choose>

                                                </xsl:attribute>

                                                <xsl:value-of
                                                    select="status"/>

                                            </span>

                                        </td>


                                    </tr>


                                </xsl:for-each>


                            </tbody>

                        </table>

                    </div>

                </div>

            </main>



            <!-- =================================================
                              FOOTER
            ================================================== -->

            <footer>

                <p>

                    <strong>
                        XML + XSLT Product Management System
                    </strong>

                </p>

                <p>

                    Experiment No. 02 |
                    XML | XSLT | HTML | CSS

                </p>

                <p>

                    Developed for Academic Demonstration

                </p>

            </footer>


        </body>

        </html>

    </xsl:template>


</xsl:stylesheet>